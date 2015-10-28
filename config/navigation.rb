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
    nav.item :users, label(:users, :user), admin_users_path,
      highlights_on: %r{^/admin/users}
    nav.item :groups, label(:groups, :users), admin_groups_path,
      highlights_on: %r{^/admin/groups}
    nav.item :tasks, label(:tasks, :book), admin_tasks_path,
      highlights_on: %r{^/admin/tasks}
    nav.item :exams, label(:exams, :'graduation-cap'), admin_exams_path,
      highlights_on: %r{^/admin/exams}
  end

  teachers_navigation = lambda do |nav|
    nav.item :scores, label(:scores, :pencil), exam_groups_path,
      highlights_on: %r{^/exam/groups}
  end

  reports_navigation = lambda do |nav|
    nav.item :reports, label(:reports, :'bar-chart'), '#'
  end

  main_navigation = lambda do |nav|
    nav.item :teacher, label(:teacher, :'pencil-square-o'), '#', &teachers_navigation
    nav.item :reports, label(:reports, :'bar-chart'), '#', &reports_navigation
    nav.item :admin, label(:admin, :lock), '#', &admin_navigation
  end

  if signed_in?
    navigation.items(&main_navigation)
  else
    navigation.items(&guest_navigation)
  end
end
