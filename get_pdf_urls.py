import bs4
import urllib3

DATA_SOURCE_URL = 'http://societymusictheory.org/archives/past_meetings'
DATA_SOURCE_BASE = 'http://societymusictheory.org'

http = urllib3.PoolManager()

request = http.request('GET', DATA_SOURCE_URL)

soup = bs4.BeautifulSoup(request.data)

links = soup.find_all('a')

hrefs = [l.get('href') for l in links]
pdf_hrefs = [l for l in hrefs if '.pdf' in l]
for href in pdf_hrefs:
    if href[0] == '/':
        print(DATA_SOURCE_BASE + href)
    else:
        print(href)
    
