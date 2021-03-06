require 'pry'
class Doctor
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(patient, date)
    app = Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self

    end
  end

  def patients
    self.appointments.map do |appointment|
      appointment.patient
    end
  end

  def self.all
    @@all
  end

end
