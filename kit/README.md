# X QA Memo Kit

このリポジトリは、Xアカウント「業務システム設計｜QA整理」向けに
- 投稿ネタ（初回20本）
- 投稿ネタ生成プロンプト
- Pythonでのネタ管理（安全運用）
- 「どの投稿でDMが来たか」分析設計（SQLite）

をまとめたスターターキットです。

## フォルダ構成
- prompts/ : 投稿ネタ生成プロンプト
- content/posts/ : 投稿ネタ YAML
- content/samples/ : 固定ポスト/初投稿サンプル
- scripts/ : 便利スクリプト
- data/ : SQLiteスキーマなど
- docs/ : 運用/分析ドキュメント

## 使い方（最小）
1) content/posts/posts_001.yaml から1本選ぶ
2) 人が確認してXに手動投稿
3) DMが来たら data を更新して週次で傾向を見る（docs/analysis_design.md）

## 注意
- 自動DM送信/自動フォロー等は行わない（凍結リスク回避）
- DM内容は個人情報が含まれるため、保存する場合は要約/ラベルのみにする
