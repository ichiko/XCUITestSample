# XCUITestSample

## 要素の指定

タップや入力のための要素の指定は、表示文字列 / AccessibilityLabel / AccessibilityIdentifier で絞り込みを行う。

## 要素の検証

### 要素の取得方法

表示されている値を検証する場合は、その要素に対してStoryboard上で、AccessibilityLabel を指定してはいけない。
AccessibilityLabel が指定されていると、`element.label`が、AccessibilityLabelの値を返すようになる。

- AccessibilityLabel を編集すると、空文字列`""`がLabelとして指定されるので注意が必要。
- 必要なら、Storyboardファイルを直接編集して、AccessibilityLabelを削除する。

要素を特定する安全な方法は、以下の2つ。

`XCUIApplication().staticTexts["accessibilityIdentifier"]`

`XCUIApplication().staticTexts.elementBoundByIndex(2)`

`element.label == "ExpectString"`とすることで、値の判定が可能。
