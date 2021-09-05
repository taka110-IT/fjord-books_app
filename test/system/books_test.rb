# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'MyString'
    assert_text 'MyText'
    assert_text 'MyAuthor'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    find('#edit').click

    fill_in 'タイトル', with: 'two'
    fill_in 'メモ', with: 'twotwo'
    fill_in '著者', with: 'twotwotwo'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'two'
    assert_text 'twotwo'
    assert_text 'twotwotwo'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
