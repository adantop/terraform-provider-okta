data "okta_brands" "test" {
}

data "okta_email_customizations" "forgot_password" {
  brand_id = tolist(data.okta_brands.test.brands)[0].id
  template_name = "ForgotPassword"
}

resource "okta_email_customization" "forgot_password_en" {
  brand_id         = tolist(data.okta_brands.test.brands)[0].id
  template_name    = "ForgotPassword"
  language         = "en"
  is_default       = false
  subject          = "Account password reset"
  body             = "Hello $$user.firstName,<br/><br/>Click this link to reset your password: $$resetPasswordLink"
  depends_on = [
    okta_email_customization.forgot_password_es
  ]
}

resource "okta_email_customization" "forgot_password_es" {
  brand_id         = tolist(data.okta_brands.test.brands)[0].id
  template_name    = "ForgotPassword"
  language         = "es"
  is_default       = true
  subject          = "Restablecimiento de contraseña de cuenta"
  body             = "Qué tal $$user.firstName,<br/><br/>Haga clic en este enlace para restablecer tu contraseña: $$resetPasswordLink"
}