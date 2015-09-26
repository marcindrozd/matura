# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'selected'
  navigation.active_leaf_class = 'active'
  navigation.autogenerate_item_ids = false
  navigation.auto_highlight = true

  def label(key, icon)
    fa_icon(icon, text: t("layouts.application.sidebar.#{key}"), fw: true)
  end

  def raw_label(text, icon)
    fa_icon(icon, text: text, fw: true)
  end

  guest_navigation = lambda do |nav|
    nav.item :sign_in, label(:sign_in, 'sign-in'), new_user_session_path,
      highlights_on: %r{^/users/sign_in$}
    nav.item :new_password, label(:new_password, :key), new_user_password_path,
      highlights_on: %r{^/users/password/new$}
  end

  admin_navigation = lambda do |nav|
    nav.item :users, label(:users, :users), admin_users_path,
      highlights_on: %r{^/admin/users}
    nav.item :groups, label(:exams, :'shopping-cart'), admin_exams_path,
      highlights_on: %r{^/admin/exams}
    nav.item :skills, label(:skills, :users), admin_skills_path,
      highlights_on: %r{^/admin/skills}
  end

  if signed_in?
    navigation.items(&admin_navigation)
  else
    navigation.items(&guest_navigation)
  end
end
