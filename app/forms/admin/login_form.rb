class Admin::LoginForm
  # form_withのmodelオプションに指定できるようになる
  include ActiveModel::Model
    # フォームフィールドのフィールド名
  attr_accessor :email, :password
  end