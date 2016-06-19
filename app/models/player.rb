class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def parse(date)
    month = date.to_s(:month_non_int)
    day = date.to_s(:day_as_int).to_i
    year = date.to_s(:long_year).to_i
    return "#{month} #{day.to_s}, #{year}"
  end

end
