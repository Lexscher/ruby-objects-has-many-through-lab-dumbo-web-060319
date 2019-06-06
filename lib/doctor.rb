class Doctor 

    attr_reader :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        apt = Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select do |apt|
            apt.doctor == self
        end
    end

    def patients
        my_patients = []

        self.appointments.each do |apt|
            my_patients << apt.patient if apt.doctor == self
        end

        my_patients
    end

end