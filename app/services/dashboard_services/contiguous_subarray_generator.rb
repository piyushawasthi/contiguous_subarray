#############################################################################################
# Contiguous Sub-array Generator
#############################################################################################

module DashboardServices
  class ContiguousSubarrayGenerator

    # slug generator
    def initialize(array)
      @contiguous = {
        :sum => array[0],
        :start => 0,
        :end => 0
      }
      @input_array = array
      @success = nil
      @errors  = []
    end

    def process!
      if @input_array.present?
        contiguous_subarray(@input_array)
        success!
        @error_message = nil
      else
        failure!
        @error_message ||= "Input Array Error."
      end
      @contiguous
    end

    def contiguous_subarray(array)
      (0..array.length-1).each do |start_at|
        sum = 0
        start_num = array[ start_at]
        next if @contiguous[:sum] > start_num and start_num < 0
        
        (start_at..array.length-1).each do |end_at|
          end_num = array[end_at]
          sum += end_num
          if sum > @contiguous[:sum]
            @contiguous[:sum] = sum
            @contiguous[:start] = start_at
            @contiguous[:end] = end_at
          end
        end
      end
    end

    private
    
    def success!
      @success = true
    end

    def failure!
      @success = false
    end
   
  end
end