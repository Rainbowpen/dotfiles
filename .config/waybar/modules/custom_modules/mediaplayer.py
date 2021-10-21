#!/usr/bin/env python3
import argparse
import logging
import sys
import signal
import gi
import json
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib

import threading
import time

logger = logging.getLogger(__name__)


spotify_is_up = False
show_index = 0
show_len = 20
show_text = ''
g_player = None
isplaying = None
stop_output = True
def output_text():
    global show_index, show_len, show_text, g_player, stop_output
    icons = ['', '', '', '']
    
    while True:
        text = ''

        if stop_output or not g_player:
            time.sleep(5)
            continue

        if show_index >= len(show_text):
            show_index = 0

        if len(show_text) <= show_len:
            text = show_text
        elif show_len+show_index <= len(show_text):
            text = show_text[show_index:show_len+show_index]
        else:
            text = show_text[show_index:] + '   ' + show_text[:(show_index+show_len)-len(show_text)]
            text = text[:-3]

        show_index += 1

        if not isplaying:
            text += '  '
        else:
            icons_index = 0
            if show_index <= len(icons):
                icons_index = show_index-1
            else:
                icons_index = show_index%len(icons)
            text += ' ' + icons[icons_index] + ' '
        write_output(text, g_player)

        time.sleep(0.5)




def write_output(text, player):
    logger.info('Writing output')

    output = {'text': text,
              'class': 'custom-' + player.props.player_name,
              'alt': player.props.player_name}

    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()


def on_play(player, status, manager):
    logger.info('Received new playback status')
    on_metadata(player, player.props.metadata, manager)


def on_metadata(player, metadata, manager):
    global g_player, show_text, isplaying

    logger.info('Received new metadata')
    track_info = ''

    if player.props.player_name == 'spotify' and \
            'mpris:trackid' in metadata.keys() and \
            ':ad:' in player.props.metadata['mpris:trackid']:
        track_info = 'AD PLAYING'
    elif player.get_artist() != '' and player.get_title() != '':
        track_info = '{artist} - {title}'.format(artist=player.get_artist(),
                                                 title=player.get_title())
    else:
        track_info = player.get_title()

    if player.props.status != 'Playing' and track_info:
        track_info = track_info # + '  ' 
        isplaying = False
    else:
        isplaying = True


    g_player = player
    show_text = track_info
    #write_output(track_info, player)


def on_player_appeared(manager, player, selected_player=None):
    global stop_output
    if player is not None and (selected_player is None or player.name == selected_player):
        init_player(manager, player)
        if stop_output != False:
            stop_output = False
    else:
        logger.debug("New player appeared, but it's not the selected player, skipping")


def on_player_vanished(manager, player):
    global stop_output
    logger.info('Player has vanished')
    sys.stdout.write('\n')
    sys.stdout.flush()

    if stop_output != True:
        stop_output = True



def init_player(manager, name):
    logger.debug('Initialize player: {player}'.format(player=name.name))
    player = Playerctl.Player.new_from_name(name)
    player.connect('playback-status', on_play, manager)
    player.connect('metadata', on_metadata, manager)
    manager.manage_player(player)
    on_metadata(player, player.props.metadata, manager)

def signal_handler(sig, frame):
    logger.debug('Received signal to stop, exiting')
    sys.stdout.write('\n')
    sys.stdout.flush()
    # loop.quit()
    sys.exit(0)

def parse_arguments():
    parser = argparse.ArgumentParser()

    # Increase verbosity with every occurrence of -v
    parser.add_argument('-v', '--verbose', action='count', default=0)

    # Define for which player we're listening
    parser.add_argument('--player')

    return parser.parse_args()


def main():
    arguments = parse_arguments()

    # Initialize logging
    logging.basicConfig(stream=sys.stderr, level=logging.DEBUG,
                        format='%(name)s %(levelname)s %(message)s')

    # Logging is set by default to WARN and higher.
    # With every occurrence of -v it's lowered by one
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    # Log the sent command line arguments
    logger.debug('Arguments received {}'.format(vars(arguments)))

    t = threading.Thread(target = output_text)
    t.start()

    manager = Playerctl.PlayerManager()
    loop = GLib.MainLoop()

    manager.connect('name-appeared', lambda *args: on_player_appeared(*args, arguments.player))
    manager.connect('player-vanished', on_player_vanished)

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    for player in manager.props.player_names:
        if arguments.player is not None and arguments.player != player.name:
            logger.debug('{player} is not the filtered player, skipping it'
                         .format(player=player.name)
                         )
            continue

        init_player(manager, player)

    #if count == 0:
    #    t.kill()
    #    t.join()
    
    loop.run()
    #t.kill()
    t.join()


if __name__ == '__main__':
    main()

