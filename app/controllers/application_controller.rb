# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def locale_from_url
    locale = params[:locale]

    locale if I18n.available_locales.map(&:to_s).include?(locale)
  end

  def default_url_options
    { locale: I18n.locale }
  end
  #
  # private
  # def extract_locale_from_accept_language_header
  #   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  # end
end
