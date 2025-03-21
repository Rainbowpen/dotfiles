function fish_user_key_bindings
  fzf_key_bindings

  # Execute this once per mode that emacs bindings should be used in
  fish_default_key_bindings -M insert

  # enable vi mode
  fish_vi_key_bindings --no-erase insert
end
