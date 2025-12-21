# Redmine Discord Pinger Plugin

Redmineのチケット詳細画面に「Audit」ボタンを追加し、ワンクリックでDiscordへ作業開始通知（定型文）を送信するプラグインです。

## 機能

* チケット詳細画面の右上のメニューに「Audit」ボタンを追加します。
* ボタンをクリックすると、設定されたDiscord Webhookへ以下のメッセージを送信します。
    * **送信フォーマット**:
        ```text
        [ユーザー名]が作業中です。
        [チケットタイトル] [チケットURL]
        ```
* Redmineの権限設定（Roles and permissions）により、ボタンの使用を許可するロールを制御できます。

## インストール方法

1.  Redmineのプラグインディレクトリに移動します。
    ```bash
    cd /path/to/redmine/plugins
    ```
2.  リポジトリをクローンします。
    ```bash
    git clone https://github.com/Tatsu0809/redmine_discord_pinger/
    ```
3.  Redmineを再起動します。

## 設定

### 1. Webhook URLの設定
1.  Redmineに管理者アカウントでログインします。
2.  **管理 > プラグイン > Redmine Discord Pinger Plugin** の「設定」をクリックします。
3.  **Discord Webhook URL** に、通知先のDiscordチャンネルのWebhook URLを入力して保存します。

### 2. 権限の設定（必須）
このプラグインはRedmineの権限システムを使用しています。初期状態では誰にも権限が付与されていないため、以下の手順で設定を行ってください。

1.  **管理 > ロールと権限** を開きます。
2.  通知を使用させたいロールをクリックします。
3.  **「チケットトラッキング」** カテゴリの中にある **「Audit discord」** にチェックを入れます。
4.  保存します。

※ この設定を行わない場合、ボタンを押しても `403 Forbidden` エラー（権限がありません）が表示されます。

