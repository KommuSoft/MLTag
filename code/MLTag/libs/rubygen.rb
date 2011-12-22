WORD_START_RE         = %r{^\.} #:nodoc:
WORD_END_RE           = %r{\.$} #:nodoc:
DIGIT_RE              = %r{\d} #:nodoc:
NONDIGIT_RE           = %r{\D} #:nodoc:
DASH_RE               = %r{-} #:nodoc:
EXCEPTION_DASH0_RE    = %r{[^-](?=[^-])} #:nodoc:
EXCEPTION_DASH1_RE    = %r{[^-]-} #:nodoc:
EXCEPTION_NONUM_RE    = %r{[^01]} #:nodoc:
ZERO_INSERT_RE        = %r{(\D)(?=\D)} #:nodoc:
ZERO_START_RE         = %r{^(?=\D)} #:nodoc:
DEBUG = false

def scan_re #:nodoc:
if RUBY_VERSION < '1.9.1'
return %r{.}u if @encoding =~ /utf-?8/i
end
return %r{.}
end

file = File.open("en_uk.rb", "r")
fw = File.new("results.dat","w")
@pattern_text = file.read()
file.close()

    @patterns = {
      :both   => {}, 
      :start  => {},
      :stop   => {},
      :hyphen => {}
    }

def both
@patterns[:both]
end

# Patterns that match the beginning of a word.
def start
@patterns[:start]
end

# Patterns that match the end of a word.
def stop
@patterns[:stop]
end

def make_result_list(res)
    r = []
    res.each_with_index { |c, i| r <<  i * (c.to_i % 2) }
    r.reject { |i| i.to_i == 0 }
  end

# Patterns that hyphenate mid-word.
def hyphen
@patterns[:hyphen]
end

    plist = @pattern_text.split($/).map { |ln| ln.gsub(%r{%.*$}, '') }
    plist.each do |line|
      line.split.each do |word|
        next if word.empty?

        start = stop = false

        start = true if word.sub!(WORD_START_RE, '')
        stop  = true if word.sub!(WORD_END_RE, '')

        # Insert zeroes and start with some digit
        word.gsub!(ZERO_INSERT_RE) { "#{$1}0" }
        word.gsub!(ZERO_START_RE, "0")

        # This assumes that the pattern lists are already in lowercase
        # form only.
        tag   = word.gsub(DIGIT_RE, '')
        value = word.gsub(NONDIGIT_RE, '')

        if start and stop
          set = :both
	  fw.write(0)
        elsif start
          set = :start
	  fw.write(1)
        elsif stop
          set = :stop
	  fw.write(2)
        else
          set = :hyphen
	  fw.write(3)
        end
	fw.write(" ")
	fw.write(tag)
	fw.write(" ")
	fw.write(value)
	fw.write("\n")
        @patterns[set][tag] = value
      end
    end

word = "maximize"
$stderr.puts "Hyphenating #{word}" if DEBUG

letters = word.scan(scan_re)
$stderr.puts letters.inspect if DEBUG
word_size = letters.size

result = [0] * (word_size + 1)
right_stop = word_size - 0

updater = Proc.new do |hash, str, pos|
if hash.has_key?(str)
$stderr.print "#{pos}: #{str}: #{hash[str]}" if DEBUG
hash[str].scan(scan_re).each_with_index do |cc, ii|
  cc = cc.to_i
  result[ii + pos] = cc if cc > result[ii + pos]
end
$stderr.print ": #{result.inspect}\n" if DEBUG
end
end

# Walk the word
(0..right_stop).each do |pos|
rest_length = word_size - pos
(1..rest_length).each do |length|
substr = letters[pos, length].join('')
updater[hyphen, substr, pos]
updater[start, substr, pos] if pos.zero?
updater[stop, substr, pos] if (length == rest_length)
end
end

updater[both, word, 0] if both[word]

(0..0).each { |i| result[i] = 0 }
((-1 - 0)..(-1)).each { |i| result[i] = 0 }

puts make_result_list(result)

fw.close()
    true
