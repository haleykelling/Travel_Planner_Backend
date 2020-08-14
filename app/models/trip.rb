class Trip < ApplicationRecord
    has_many :days
    belongs_to :user

    validates :name, :start_date, :end_date, presence: true

    def create_days
        number_of_days = (self.end_date - self.start_date).to_i + 1
        n = 0
        while n < number_of_days
          Day.create(date: (self.start_date + n), trip: self)
          n+=1
        end
    end

    def edit_days(start_date, end_date)
        start_date = Date.parse(start_date)
        end_date = Date.parse(end_date)
        new_number_of_days = (end_date - start_date).to_i + 1
        old_number_of_days = (self.end_date - self.start_date).to_i + 1
        
        if start_date == self.start_date && end_date == self.end_date
            return
        elsif new_number_of_days > old_number_of_days
            if start_date < self.start_date && end_date == self.end_date
                # add days to beginning
                days_to_add = (self.start_date - start_date).to_i
                n = 1
                while n <= days_to_add
                    Day.create(date: self.start_date - n, trip: self)
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
            elsif start_date < self.start_date && end_date > self.end_date
                # add days to beginning and end
                days_to_add_to_beginning = (self.start_date - start_date).to_i
                days_to_add_to_end = (end_date - self.end_date).to_i
                n = 1
                while n <= days_to_add_to_beginning
                    Day.create(date: self.start_date - n, trip: self)
                    n += 1
                end
                num = 1
                while num <= days_to_add_to_end
                    Day.create(date: self.end_date + num, trip: self)
                    num += 1
                end
            else
                self.days.each_with_index do |day, index|
                    day.update(date: start_date + index)
                end
                n = 1
                while n <= (new_number_of_days - old_number_of_days)
                    Day.create(date: self.days.last.date + n, trip: self)
                    n += 1
                end
            end
            return
        elsif new_number_of_days == old_number_of_days
            #create all new dates
            self.days.each_with_index do |day, index|
                day.update(date: start_date + index)
            end
            return
        elsif new_number_of_days < old_number_of_days 
            n = old_number_of_days - new_number_of_days
            n.times do
                day = self.days.last
                day.destroy
            end
            self.days.each_with_index do |day, index|
                day.update(date: start_date + index)
            end
            return
        end
    end
end
