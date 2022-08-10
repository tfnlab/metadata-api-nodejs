###
#  to run use:
#     ruby ./generate.rb


require 'pixelart'


PARTS = {
  shirt:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u'],
                        ['3', 'u'],
                        ['4', 'u'],
                        ['5', 'u'],
                        ['6', 'u']] },
  body:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u']] },
  smile:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u'],
                        ['3', 'u'],
                        ['4', 'u'],
                        ['5', 'u']] },
  gum:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u']] },
  earring:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u']] },
  lazers:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u'],
                        ['3', 'u'],
                        ['4', 'u'],
                        ['5', 'u'],
                        ['6', 'u']] },
  chain:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u'],
                        ['3', 'u']] },
  hats:  { required: true,
           attributes: [['0', 'u'],
                        ['1', 'u'],
                        ['2', 'u'],
                        ['3', 'u'],
                        ['4', 'u'],
                        ['5', 'u'],
                        ['6', 'u'],
                        ['7', 'u']] }
 }



def generate_punk( codes )
  punk = Pixelart::Image.new( 1500, 1500 )

  PARTS.each_with_index do |(key,part),i|
      code  = codes[i]
      attribute = part[:attributes][ code]


      path = "/opt/tomcat/webapps/ROOT/parts/#{key}/#{code}.png"
      part = Pixelart::Image.read( path )
      punk.compose!( part )
  end

  punk
end

args = ARGV[0].split
filename = "%s/%d.png" % ["/opt/tomcat/webapps/ROOT", 0]

$shirt = args[0].to_i
$body = args[1].to_i
$smile = args[2].to_i
$gum = args[3].to_i
$lazers = args[4].to_i
$hats = args[5].to_i
$earring = args[6].to_i
$chain = args[7].to_i

if $smile == 5
  $gum = 0
end

puts("PRINTING ALL #$i #$all")
codes = [$shirt, $body, $smile, $gum, $earring, $lazers, $chain, $hats]
punk = generate_punk( codes )
punk.save( filename )
