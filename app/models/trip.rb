class Trip < ApplicationRecord
    has_many :days

    validates :name, :start_date, :end_date, presence: true

    def edit_days(start_date, end_date)
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date)
        new_number_of_days = (end_date - start_date).to_i + 1
        old_number_of_days = (self.end_date - self.start_date).to_i + 1
        
        if start_date == self.start_date && end_date == self.end_date
            return
        elsif start_date < self.start_date && end_date == self.end_date
            # add days to beginning
            days_to_add = (self.start_date - start_date).to_i
            n = 1
            while n <= days_to_add
                Day.create(date: self.start_date - n, trip: self)
                n += 1
            end
        elsif start_date < self.start_date && end_date > self.end_date
            # add days to beginning and end
            days_to_add_to_beginning = (self.start_date - start_date).to_i
            days_to_add_to_end = (end_date - self.end_date).to_i
            n = 1
            while n <= days_to_add_to_beginning
                Day.create(date: self.start_date - n, trip: self)
                n += 1
            end
            while n <= days_to_add_to_end
                Day.create(date: self.end_date + n, trip: self)
                n += 1
            end
        elsif start_date == self.start_date && end_date > self.end_date
            #add days to end
            days_to_add = (end_date - self.end_date).to_i
            n = 1
            while n <= days_to_add
                Day.create(date: self.end_date + n, trip: self)
                n += 1
            end
        elsif new_number_of_days == old_number_of_days
            #create all new dates
            n = 0
            self.days.each do |day|
                day.update(date: start_date + n)
                n += 1
            end
        elsif new_number_of_days < old_number_of_days 
            while self.days.length > new_number_of_days
                day = self.days.last
                day.destroy
            end
            n = 0
            self.days.each do |day|
                day.update(date: start_date + n)
                n += 1
            end
        elsif new_number_of_days > old_number_of_days
            n = 0 
            self.days.each do |day|
                day.update(date: start_date + n)
                n += 1
            end
            count = 1
            while count <= (new_number_of_days - old_number_of_days)
                Day.create(date: end_date + count, trip: self)
            end
        end
    end
end
