class Transcript < ActiveRecord::Base
  enum format: %i(transcription caption)
  DEFAULT_LOCALE ||= 'en'

  include PgSearch
  multisearchable against: %i(text), using: %i(tsearch trigram dmetaphone), ignoring: %i(accents)

  belongs_to :video,
    class_name: 'YouTube::Video',
    inverse_of: :transcripts

  after_initialize do
    self.locale = DEFAULT_LOCALE unless locale.present?
  end

  def using_default_locale?
    locale == DEFAULT_LOCALE
  end

  def supported_locales
    @supported_locales ||= {
      'zh-CN' => 'Chinese Simplified',
      'zh-TW' => 'Chinese Traditional',
      'af' => 'Afrikaans',
      'ar' => 'Arabic',
      'az' => 'Azerbaijani',
      'be' => 'Belarusian',
      'bg' => 'Bulgarian',
      'bn' => 'Bengali',
      'ca' => 'Catalan',
      'cs' => 'Czech',
      'cy' => 'Welsh',
      'da' => 'Danish',
      'de' => 'German',
      'el' => 'Greek',
      'en' => 'English',
      'eo' => 'Esperanto',
      'es' => 'Spanish',
      'et' => 'Estonian',
      'eu' => 'Basque',
      'fa' => 'Persian',
      'fi' => 'Finnish',
      'fr' => 'French',
      'ga' => 'Irish',
      'gl' => 'Galician',
      'gu' => 'Gujarati',
      'hi' => 'Hindi',
      'hr' => 'Croatian',
      'ht' => 'Haitian Creole',
      'hu' => 'Hungarian',
      'id' => 'Indonesian',
      'is' => 'Icelandic',
      'it' => 'Italian',
      'iw' => 'Hebrew',
      'ja' => 'Japanese',
      'ka' => 'Georgian',
      'kn' => 'Kannada',
      'ko' => 'Korean',
      'la' => 'Latin',
      'lt' => 'Lithuanian',
      'lv' => 'Latvian',
      'mk' => 'Macedonian',
      'ms' => 'Malay',
      'mt' => 'Maltese',
      'nl' => 'Dutch',
      'no' => 'Norwegian',
      'pl' => 'Polish',
      'pt' => 'Portuguese',
      'ro' => 'Romanian',
      'ru' => 'Russian',
      'sk' => 'Slovak',
      'sl' => 'Slovenian',
      'sq' => 'Albanian',
      'sr' => 'Serbian',
      'sv' => 'Swedish',
      'sw' => 'Swahili',
      'ta' => 'Tamil',
      'te' => 'Telugu',
      'th' => 'Thai',
      'tl' => 'Filipino',
      'tr' => 'Turkish',
      'uk' => 'Ukrainian',
      'ur' => 'Urdu',
      'vi' => 'Vietnamese',
      'yi' => 'Yiddish'
    }
  end

  rails_admin do
    configure :format do
      searchable false
    end
  end
end

# == Schema Information
#
# Table name: transcripts
#
#  id         :integer          not null, primary key
#  locale     :string
#  video_id   :integer
#  text       :text
#  format     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
