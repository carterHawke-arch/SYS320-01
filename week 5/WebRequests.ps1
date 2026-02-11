$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.9/ToBeScraped.html

$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where {
$_.getAttributeNode("class").value -ilike "div-1"} | Select innerText

$divs1