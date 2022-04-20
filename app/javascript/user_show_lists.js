window.addEventListener('DOMContentLoaded', () => {
  const tabs = document.getElementsByClassName('tab_menu');
  
    for(let i = 0; i < tabs.length; i++){
      tabs[i].addEventListener('click',tabSwitch);
    }
    function tabSwitch(){
      // class属性で'active'を持っている要素から'active'クラスを削除。
      document.getElementsByClassName('active')[0].classList.remove('active');
      // this=クリックした要素(tabs[i])に対して、'active'クラスを付与。
      this.classList.add('active');

      // class属性で'show'を持っている要素から'active'クラスを削除。
      document.getElementsByClassName('show')[0].classList.remove('show');

      // Array.prototype.slice.call(arguments);=argumentsを配列に変換する
      const arrayTabs = Array.prototype.slice.call(tabs);
      // arrayTabsの中に格納されている文字列と、thisの中で一致している文字列を抽出。(インデックス版業が取得される。何番目該当の文字があるかで数字が返り値になる)
      const index = arrayTabs.indexOf(this);

      // クリックした要素をindex番号で取得し、'show'クラスを付与する。
      document.getElementsByClassName('tab_detail_wrap')[index].classList.add('show');
    };
  })
  

 