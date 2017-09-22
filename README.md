# Tierion_autoupdate

複数のノードのgit pullを自動で行うスクリプトです。セキュリティ設定が関わるスクリプトなので、使用は自己責任でお願いします。

クライアント：OS X   

ホスト：Ubuntu 16.04

で動作確認済。

https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04  


【前提条件】

ホスト側のセキュリティ設定は上記リンクのごとく設定し、非rootユーザーで公開鍵認証でログインしたのちに、sudoでroot権限が必要なコマンドを行う設定となっていることが前提。  

ホスト側とクライアント側の接続は公開鍵認証設定が終わっていて、パスフレーズの入力は省略している状況が前提。  

ホスト側のsudoのためのパスワードは複数のホスト間で共通していることが前提。  



【使用方法】

1. zipファイルをダウンロードして解凍する。

2. Nodeのインストールをrootで行なっている場合は、autoupdate.shの12行目、

   cd chainpoint-node

   を

   cd ~/chainpoint-node

   に変更するか、フルパスに変更する。

3. address.txtに [接続に利用するユーザー名]@[IPアドレス] を1行に1接続先で書き込む。最後の行は必ず改行する。

   ファイアウォール設定済みの場合は、[接続に利用するユーザー名]@[IPアドレス] -p [ポート番号] のように記載する。
   
4. ダウンロードしたtierion_autoupdate-masterディレクトリ内で、./autoupdate.sh を実行。

5. 最初にsudoのためのパスワードを入力する。入力したパスワードは各サーバでsudoコマンドを実行するときに適用される。

6. address.txtに記載した接続先全てで、make down、git pull、make up が実行される。


