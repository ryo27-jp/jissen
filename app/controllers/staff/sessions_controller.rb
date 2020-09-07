class Staff::SessionsController < Staff::Base
  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Staff::LoginForm.new(params[:staff_login_form])
    if @form.email.present?
      staff_member  = 
                      StaffMember.find_by("LOWER(email)= ?", @form.email.downcase)
    end
    # authenticate.rbで定義されたメソッドでフォームから送られてきたパラメーターが登録されたデーターと一致するかを確認する。
    if staff_member.suspended?
      flash.now.alert = "アカウントが停止されています。"
      render action: "new"
    elsif
      session[:staff_member_id] = staff_member.id
      flash.notice = "ログインしました。"
      redirect_to :staff_root
    else
      flash.now.alert = "メールアドレスが正しくありません。"
      render action: "new"
    end
  end

  def destroy
    session.delete(:staff_member_id)
    flash.notice = "ログアウトしました。"
    redirect_to :staff_root
  end
end
