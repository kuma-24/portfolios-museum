module Api
  module V1
    class LikesController < ApplicationController

      def create
        like = current_user.likes.create!(user_id: current_user, post_id: params[:post_id])
        postCount = Like.where( post_id: params[:post_id]).count
        # ローカル変数:like に「現在のユーザー：current_user」の「likesモデル」の「create!」メソッドにより、
        # likeには、生成された値が代入される。
        render json: {
          like_id: like.id,
          post_id: postCount
        } 
        # json形式でlike_id: like.id（likeテーブルのidレコード）が返り値となる。

        #「paramsメソッド」は、パラメータ（キー）のバリュー（値）を取得するメソッド。(送られてきたデータを使う)
        #「user: current_user」は、「カラム名: 値」と読む。
        #「createメソッド」の返り値は、「モデルのインスタンス」例：Userモデルのインスタンスはuser.カラム名
        #「createメソッド」は、モデルのインスタンス生成と保存を同時に行うクラスメソッド。   
        #「create!メソッド」は、バリューの値が空っぽの場合、例外を返す。他の機能は同じ。
        #「renderメソッド」は、呼び出すテンプレートファイルを指定する。
        #「render json」とすると、json形式でレスポンスを返す。

        #「like」は、「ローカル変数」で、メソッドやクラス、モジュールの中で定義された範囲内でのみ参照できる。
      end 

      def destroy
        Like.find(params[:id]).destroy!
        postCount = Like.where( post_id: params[:post_id]).count
        # postCount = Like.counter_cache: :likes_count
        render json: { post_id: postCount }

        #「findメソッド」は引数で指定したidのレコードを１件取得します。
      end

    end
  end
end