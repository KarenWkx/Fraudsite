require 'test_helper'

class IcosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ico = icos(:one)
  end

  test "should get index" do
    get icos_url
    assert_response :success
  end

  test "should get new" do
    get new_ico_url
    assert_response :success
  end

  test "should create ico" do
    assert_difference('Ico.count') do
      post icos_url, params: { ico: { admin_approved: @ico.admin_approved, country: @ico.country, date_approved: @ico.date_approved, date_submitted: @ico.date_submitted, description: @ico.description, email: @ico.email, ico_name: @ico.ico_name, ranking: @ico.ranking, reason: @ico.reason, release_date: @ico.release_date, status: @ico.status, symbol: @ico.symbol, website: @ico.website, whitepaper: @ico.whitepaper } }
    end

    assert_redirected_to ico_url(Ico.last)
  end

  test "should show ico" do
    get ico_url(@ico)
    assert_response :success
  end

  test "should get edit" do
    get edit_ico_url(@ico)
    assert_response :success
  end

  test "should update ico" do
    patch ico_url(@ico), params: { ico: { admin_approved: @ico.admin_approved, country: @ico.country, date_approved: @ico.date_approved, date_submitted: @ico.date_submitted, description: @ico.description, email: @ico.email, ico_name: @ico.ico_name, ranking: @ico.ranking, reason: @ico.reason, release_date: @ico.release_date, status: @ico.status, symbol: @ico.symbol, website: @ico.website, whitepaper: @ico.whitepaper } }
    assert_redirected_to ico_url(@ico)
  end

  test "should destroy ico" do
    assert_difference('Ico.count', -1) do
      delete ico_url(@ico)
    end

    assert_redirected_to icos_url
  end
end
