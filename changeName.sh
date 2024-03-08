#!/bin/bash

# 新しいプロジェクト名
# !!!!ここを変更したいプロジェクト名に変更してください!!!
new_project_name="NewProjectName"

# 置換対象の旧プロジェクト名
old_project_name="story_board_template"

# プロジェクトディレクトリ
project_directory="story_board_template"

# プロジェクトファイルのパス
project_file_path="$project_directory.xcodeproj/project.pbxproj"

# プロジェクトファイル内のプロジェクト名を置換
sed -i '' "s/$old_project_name/$new_project_name/g" "$project_file_path"

# ソースコード内のプロジェクト名を置換
find "$project_directory" -type f -name "*.swift" -exec sed -i '' "s/$old_project_name/$new_project_name/g" {} +

# その他のファイルやフォルダ内のプロジェクト名を置換
# 例: find "$project_directory" -type f -name "*.txt" -exec sed -i '' "s/$old_project_name/$new_project_name/g" {} +

# Storyboardファイル内のプロジェクト名を置換
find "$project_directory" -type f -name "*.storyboard" -exec sed -i '' "s/$old_project_name/$new_project_name/g" {} +

# Info.plistファイル内のプロジェクト名を置換
find "$project_directory" -type f -name "Info.plist" -exec sed -i '' "s/$old_project_name/$new_project_name/g" {} +

# ディレクトリ名を新しいプロジェクト名に置換
mv "./$old_project_name" "./$new_project_name"
mv "./$old_project_name.xcodeproj" "./$new_project_name.xcodeproj"

echo "プロジェクト名を変更しました：$old_project_name → $new_project_name"
