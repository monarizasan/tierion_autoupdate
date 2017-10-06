# Tierion_autoupdate

複数のノードのgit pullを連続で行うスクリプトです。実行して一度パスワード入力したら、あとは複数のノードを連続でupdateしてくれます。

セキュリティ設定が関わるスクリプトなので、使用は自己責任でお願いします。スクリプト自体はすごく短いです。  
  
クライアント：OS X     
  
ホスト：Ubuntu 16.04  
  
で動作確認済。セキュリティの設定は以下参照。  
  
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04    

アップデートを完全自動にしてしまいたい方はこのスクリプトではなく、こちらのスクリプトhttps://github.com/monarizasan/tierion_autoupdate_with_cron をご利用ください。
  
  
## 前提条件  
  
ホスト側のセキュリティ設定は上記リンクのごとく設定し、非rootユーザーで公開鍵認証でログインしたのちに、sudoでroot権限が必要なコマンドを行う設定となっていることが前提。    
  
ホスト側とクライアント側の接続は公開鍵認証設定が終わっていて、OSX上でパスフレーズの入力は省略している状況が前提。(パスフレーズ 省略 SSH などでググるとたくさん出てきます。)   
  
ホスト側のsudoのためのパスワードは複数のホスト間で共通していることが前提。    
  
  
  
## 使用方法  
  
1. 右上の Clone or download のボタンから、zipファイルをダウンロードして解凍する。  
  
2. autoupdate.shの18行目を自分の状況に合わせて変更し、ログインした場所からchainpoint-nodeのディレクトリに移動できるようにする。  
  
   例えば、Nodeのインストールをrootで行なっている場合は、autoupdate.shの12行目、  
  
   `cd chainpoint-node`  
  
   を  
  
   `cd ~/chainpoint-node`  
  
   に変更するか、フルパスに変更する。  
  
3. address.txtに [接続に利用するユーザー名]@[IPアドレス] を1行に1接続先で書き込んで保存する。最後の行は必ず改行する。  
  
   ファイアウォール設定済みの場合は、[接続に利用するユーザー名]@[IPアドレス] -p [ポート番号] のように記載する。  
     
4. ダウンロードしたtierion_autoupdateのディレクトリ内で、./autoupdate.sh を実行。  
  
5. 最初にsudoのためのパスワードを入力する。入力したパスワードは各サーバでsudoコマンドを実行するときに適用される。  
  
6. address.txtに記載した接続先全てで、make down、git pull、make up が実行される。  
  
  
   * autoupdate.shの17行目-23行目のヒアドキュメントの中身(<<EOFからEOFまで)を変更すれば、update以外の作業にも応用可能です。  
     
     
  
   スクリプトは以下のリンクを参考にさせていただきました。  
  
   http://keens.github.io/blog/2015/06/17/shell_scriptwokakutokinikiwotsuketaikoto/  
  
   
