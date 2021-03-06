require 'rubygems'
require 'selenium-webdriver'
require 'csv'

lista_comunas = [
  [14202,13302],
  [14203,13303],
  [16401,13401],
  [16403,13402],
  [16402,13403],
  [16404,13404],
  [14601,13501],
  [14605,13502],
  [14603,13503],
  [14602,13504],
  [8210,13505],
  [14501,13601],
  [14503,13602],
  [14502,13603],
  [14505,13604],
  [14504,13605],
  [1101,15101],
  [5303,5108],
  [16303,13203],
  [15160,13132],
  [8210,8108],
  [8109,8416],
  [8111,8417],
  [8114,8418],
  [8112,8419],
  [12401,12201],
  [1208,1402],
  [1210,1403],
  [1206,1404],
  [1203,1405],
  [1211,1107],
  [2201,2101],
  [2203,2102],
  [2206,2103],
  [2202,2104],
  [2301,2201],
  [2302,2202],
  [2303,2203],
  [2101,2301],
  [2103,2302],
  [3202,3102],
  [3203,3103],
  [3101,3201],
  [3102,3202],
  [3301,3301],
  [3304,3302],
  [3302,3303],
  [3303,3304],
  [3201,3101],
  [4101,4101],
  [4103,4102],
  [4104,4103],
  [4102,4104],
  [4106,4105],
  [4105,4106],
  [4301,4201],
  [4304,4202],
  [4303,4203],
  [4302,4204],
  [4201,4301],
  [4205,4302],
  [4203,4303],
  [4204,4304],
  [4206,4305],
  [5502,5506],
  [5604,5705],
  [5301,5101],
  [5305,5102],
  [5309,5103],
  [5308,5104],
  [5307,5105],
  [5304,5106],
  [5306,5107],
  [5302,5109],
  [5101,5201],
  [5701,5301],
  [5702,5302],
  [5704,5303],
  [5703,5304],
  [5201,5401],
  [5203,5402],
  [5205,5403],
  [5202,5404],
  [5204,5405],
  [5501,5501],
  [5504,5502],
  [5503,5503],
  [5505,5504],
  [5506,5505],
  [5403,5603],
  [5405,5604],
  [5404,5605],
  [5402,5606],
  [5601,5701],
  [5603,5702],
  [5606,5703],
  [5602,5704],
  [5605,5706],
  [5507,5507],
  [16302,13202],
  [16301,13201],
  [6110,6117],
  [6116,6103],
  [6106,6104],
  [6105,6105],
  [6103,6106],
  [6109,6107],
  [6102,6108],
  [6115,6109],
  [6104,6110],
  [6114,6111],
  [6108,6112],
  [6111,6113],
  [6117,6114],
  [6112,6115],
  [6113,6116],
  [6101,6101],
  [6301,6201],
  [6304,6202],
  [6303,6203],
  [6305,6204],
  [6302,6205],
  [6306,6206],
  [6201,6301],
  [6209,6302],
  [6202,6303],
  [6206,6304],
  [6203,6305],
  [6207,6306],
  [6208,6307],
  [6204,6308],
  [6214,6309],
  [6205,6310],
  [6107,6102],
  [7301,7401],
  [7201,7101],
  [7208,7102],
  [7207,7103],
  [7209,7104],
  [7206,7105],
  [7203,7106],
  [7205,7107],
  [7204,7108],
  [7202,7109],
  [7210,7110],
  [7401,7201],
  [7403,7202],
  [7402,7203],
  [7101,7301],
  [7107,7302],
  [7105,7303],
  [7108,7304],
  [7104,7305],
  [7103,7306],
  [7109,7307],
  [7102,7308],
  [7106,7309],
  [7303,7402],
  [7304,7403],
  [7305,7404],
  [7306,7405],
  [7310,7406],
  [7309,7407],
  [7302,7408],
  [8202,8107],
  [8306,8204],
  [8113,8402],
  [8201,8101],
  [8207,8102],
  [8211,8103],
  [8204,8104],
  [8203,8105],
  [8208,8106],
  [8305,8203],
  [8302,8205],
  [8304,8206],
  [8307,8207],
  [8401,8301],
  [8413,8302],
  [8410,8303],
  [8403,8304],
  [8407,8305],
  [8405,8306],
  [8406,8307],
  [8408,8308],
  [8404,8309],
  [8411,8310],
  [8402,8311],
  [8412,8312],
  [8409,8313],
  [8414,8314],
  [8101,8401],
  [8107,8403],
  [8120,8404],
  [8103,8405],
  [8121,8406],
  [8118,8407],
  [8105,8408],
  [8110,8409],
  [8117,8410],
  [8102,8411],
  [8106,8412],
  [8115,8413],
  [8104,8414],
  [8108,8420],
  [8116,8421],
  [8209,8109],
  [8119,8415],
  [9110,9203],
  [9201,9101],
  [9209,9102],
  [9204,9103],
  [9218,9104],
  [9203,9105],
  [9207,9106],
  [9212,9107],
  [9205,9108],
  [9214,9109],
  [9217,9110],
  [9208,9111],
  [9220,9112],
  [9206,9113],
  [9211,9114],
  [9216,9115],
  [9210,9116],
  [9219,9117],
  [9213,9118],
  [9202,9119],
  [9215,9120],
  [9221,9121],
  [9101,9201],
  [9105,9202],
  [9106,9204],
  [9111,9205],
  [9103,9206],
  [9108,9207],
  [9102,9208],
  [9104,9209],
  [9107,9210],
  [9109,9211],
  [10103,14103],
  [10104,14104],
  [10107,14105],
  [10102,14106],
  [10110,14107],
  [10108,14108],
  [10101,14101],
  [10109,14201],
  [10105,14202],
  [10112,14203],
  [10111,14204],
  [10106,14102],
  [10503,10402],
  [10301,10101],
  [10309,10102],
  [10302,10103],
  [10304,10104],
  [10305,10105],
  [10308,10106],
  [10306,10107],
  [10307,10108],
  [10303,10109],
  [10401,10201],
  [10406,10202],
  [10402,10203],
  [10410,10204],
  [10408,10205],
  [10405,10206],
  [10403,10207],
  [10404,10208],
  [10407,10209],
  [10415,10210],
  [10201,10301],
  [10203,10302],
  [10206,10303],
  [10204,10304],
  [10205,10305],
  [10207,10306],
  [10202,10307],
  [10501,10401],
  [10502,10403],
  [10504,10404],
  [11401,11101],
  [11402,11102],
  [11101,11201],
  [11102,11202],
  [11104,11203],
  [11301,11301],
  [11302,11302],
  [11303,11303],
  [11201,11401],
  [11203,11402],
  [12206,12102],
  [12202,12103],
  [12204,12104],
  [12205,12101],
  [12302,12302],
  [12304,12303],
  [12101,12401],
  [12103,12402],
  [12402,12202],
  [12301,12301],
  [13101,13101],
  [14166,13102],
  [14156,13103],
  [14127,13104],
  [16165,13105],
  [14157,13106],
  [13167,13108],
  [16110,13109],
  [16131,13111],
  [16154,13112],
  [1106,15102],
  [1301,15201],
  [1302,15202],
  [14158,13107],
  [15128,13110],
  [15132,13113],
  [15108,13114],
  [15161,13115],
  [15151,13118],
  [15105,13120],
  [15152,13122],
  [15103,13123],
  [16164,13116],
  [14155,13117],
  [14109,13119],
  [16162,13121],
  [14111,13124],
  [14114,13125],
  [14107,13126],
  [13159,13127],
  [14113,13128],
  [16163,13129],
  [16106,13130],
  [16153,13131],
  [14201,13301],
  [1201,1101],
  [1204,1401],
  [5401,5601],
  [5406,5602],
  [8206,8110],
  [8205,8111],
  [8212,8112],
  [8303,8201],
  [8301,8202]
]

def default_address(driver)
  driver.find_element(name: "DOMICILIO_TER").send_keys("Los Conquistadores 2573")
  region = driver.find_element(name: "cod_region")
  regiones = Selenium::WebDriver::Support::Select.new(region)
  regiones.select_by(:value, "13")
  comuna = driver.find_element(name: "cod_comuna")
  comunas = Selenium::WebDriver::Support::Select.new(comuna)
  comunas.select_by(:value, "15103")
end

driver = Selenium::WebDriver.for :chrome

generar = File.read(File.join(File.dirname(__FILE__), "boletas_por_generar.csv"))
generadas = File.read(File.join(File.dirname(__FILE__), "boletas_generadas.csv"))

old = CSV.table(File.join(File.dirname(__FILE__), "boletas_por_generar.csv"), headers: false)
b_x_g = CSV.parse(generar, headers: false)
b_g = CSV.parse(generadas, headers: false)

driver.get "https://zeus.sii.cl/cvc_cgi/bte/bte_indiv_ing"
driver.find_element(name: "rutcntr").send_keys("")
driver.find_element(name: "clave").send_keys("")
driver.find_element(name: "clave").submit

count = 0

b_x_g.each_with_index do |row, index|
  unless [*0..9,'K'][(row[0].split("-").first).reverse.chars.inject([0,0]){|(i,a),n|[i+1,a-n.to_i*(i%6+2)]}[1]%11].to_s != row[0].split("-").last.to_s
    break if row[0].nil?
    rut = row[0].split("-")
    driver.find_element(name: "RUT_TERC").send_keys(rut[0])
    driver.find_element(name: "DV_TERC").send_keys(rut[1])
    unless row[1].nil? or !lista_comunas.map{ |l| l[1] }.include?(row[3].to_i)
      driver.find_element(name: "DOMICILIO_TER").send_keys(row[1])
      region = driver.find_element(name: "cod_region")
      regions = Selenium::WebDriver::Support::Select.new(region)
      regions.select_by(:value, "#{row[2].to_i}")
      comuna_selected = (lista_comunas.select { |c| c[1].to_i == row[3].to_i }).flatten
      comuna = driver.find_element(name: "cod_comuna")
      comunas = Selenium::WebDriver::Support::Select.new(comuna)
      comunas.select_by(:value, "#{comuna_selected[0].to_i}")
    else
      default_address(driver)
    end
    driver.find_element(name: "PRESTA1").send_keys(row[4])
    driver.find_element(name: "VALOR1").send_keys(row[5])
    driver.find_element(name: "ACEPTAR").click
    break if driver.find_element(:xpath,"//*[contains(text(), 'BOLETA DE PRESTACION')]").nil?
    driver.find_element(name: "ACEPTAR").click
    row[6] =  (driver.find_element(:xpath,"//*[contains(text(), 'BOLETA DE PRESTACION')]").text).scan(/\d/).join('')
    CSV.open("boletas_generadas.csv", "a+") { |csv| csv << row }
    old.delete_if do |line|
      line[0] == row[0]
    end
    count += 1
  else
    puts "El RUT #{row[0]} es inválido!"
    next
  end
  break if count >= 5 or row[0].nil?
  driver.get "https://zeus.sii.cl/cvc_cgi/bte/bte_indiv_ing"
end

new = CSV.generate{ |csv| old.each { |o| csv << [o[0],o[1],o[2],o[3],o[4],o[5],o[6]] } }

File.open('boletas_por_generar.csv', 'w') { |csv| csv.write(new) }

