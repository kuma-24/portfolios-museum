# *portfolios-museum*
「*portfolios-museum*」は、`自分の作成した作品（サイトなど、なんでも）を投稿することができるwebサービス`になります。  
(ゲストユーザーで使用できます！)  
<br>
  
### リンク：[*portfolios-museum*](https://portfolios-museum.herokuapp.com/) 
(現在AWS学習中の為、herokuで運用しています。準備出来次第AWSに切り替え予定です。)  
(アドオンを使用し、アイドルタイムにならない様にしています。)

![Image1](https://user-images.githubusercontent.com/80506736/125943965-305b9ec5-a465-4a23-a33a-bd3f75355443.png)
<br>

# こだわりポイント
* ### `コメント機能といいね機能のAjax`  
   Vue.jsやReactなどの技術を採用することも当初は考えていたのですが、まずはjavascriptの理解や経験をすることが必要と考え、非同期通信にてユーザーからリクエストを送り、json形式でRails側からレスポンスとして返すという設計にしました。（将来的にVue.jsやReactなどの技術も習得していきたいと考えています）
<br>  
<br>

* ### `デザインパターン Formオブジェクト`
  今回の投稿機能には、親モデルと子モデルが存在し、一つの入力フォームから情報が作成・保存・編集・更新に対応する必要があると考え、投稿の作成・保存・編集・更新を一つのクラスにカプセル化として成立させる為に採用しました。
<br>
<br>

* ### `開発環境にDocker、CI/CDにCircleCI`
  開発当初、ローカルに開発環境を構築していたのですが、Dockerの存在を知り、学習していく中で、環境構築が容易・短時間、共有・統一、dockerが扱えるサービスの多さなどメリットと、dockerを採用する現場も多いと学びました、またdockerを学習していく中で、CircleCIについても学習し、自動テスト、自動ビルドを構築する為に、GitHubにpushされるとテストとビルドが実行され,テストがクリアすると、デプロイする環境を構築することができました。
<br>
<br>

# 使用技術
* ### フロントエンド
  * HTML５
  * SCSS
  * Javascript
<br>

* ### バックエンド
  * Ruby (3.0.0)
  * Rails (6.1.3)
<br>

* ### インフラ・開発環境
  * heroku
  * CircleCI (2.1)
  * Docker・docker-compose
  * Nginx
  * Puma
  * MySQL (8.0)
<br>

* ### テスト・静的コード解析
  * RSpec
  * Rubocop
<br>

# 機能一覧
* ### 基本機能
  * 新規登録
  * ログイン
  * ゲストログイン
  * ユーザー詳細閲覧
  * 投稿詳細閲覧
  * 投稿一覧
  * フリーワード検索
  * カテゴリー検索
<br>

* ### ユーザー登録後
  * 退会
  * ログアウト
  * アカウント編集
  * マイページ表示
  * 投稿
  * 投稿編集・削除
  * コメント機能（Ajax）
  * いいね機能（Ajax）
<br>

* ### その他機能
  * 画像投稿
  * 画像プレビュー（新規登録前・投稿前）
  * URLリンク機能（投稿詳細）
  * ページネーション
  * ランキング機能
<br>
<br>

# ER図
![image2](https://user-images.githubusercontent.com/80506736/125944489-b456b67c-f8d9-42e3-b00f-f513b257604b.png) 