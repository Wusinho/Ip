class IpStorage

  def initialize
    @ip_storage= Hash.new(0)
  end

  def request_handled(ip_address)
    @ip_storage[ip_address] = 0 if !@ip_storage[ip_address]
    @ip_storage[ip_address] += 1
    @ip_storage = @ip_storage.sort_by{ |k| k[1] }.reverse.to_h
  end

  def top100
    start = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    list = @ip_storage.first(100)
    list.each do |ele|
      puts ele.first
    end

    finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    diff = finish - start
    p "it took: #{diff}"
  end

    def show
    
      p @ip_storage.first(2)
    end



  def clear
    @ip_storage = {}
  end
end

ip = IpStorage.new


# ip.request_handled('101.123')
# ip.request_handled('101.123')
# ip.request_handled('101.123')
# ip.request_handled('101.122')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.120')
# ip.request_handled('101.121')


file = File.open("test_case.txt", "r") 

file_data = file.readlines.map(&:split)

data = file_data.flatten
top_100 = []

  data.each do |ele|
    ip.request_handled(ele)
  end
  ip.top100
p "for #{data.size} ips"
  
# data.count #300 001



