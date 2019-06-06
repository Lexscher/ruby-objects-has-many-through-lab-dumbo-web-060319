class Patient

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        apt = Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select { |apt| apt.patient == self }
    end

    def doctors
        my_doctors = []
        self.appointments.each do |apt|
            my_doctors << apt.doctor if apt.patient == self
        end

        my_doctors
    end
end