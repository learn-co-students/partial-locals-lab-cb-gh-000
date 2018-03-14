# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(input)
    if input.strip == ""
      matched_studens = self.all
    else
      matched_studens = self.all.map { |student| student if student.name.include?(input.capitalize) }
    end
    matched_studens.compact
  end
end
