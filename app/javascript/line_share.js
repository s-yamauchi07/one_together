document.addEventListener('DOMContentLoaded', () => {
  let url = location.href
  let snsLinks = $(".js-sns-link")
  console.log(snsLinks)
  for(let i = 0; i<snsLinks.length; i++) {
    let href = snsLinks.eq(i).attr('href');

    href = href.replace("url=", "url="+url)
    snsLinks.eq(i).attr('href', href)
  }

  // https://mgmgblog.com/?p=1979
  // このページを参照してJSの記述に変更する
});