require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "create favorites" do
    log_in_as users(:michael)
    assert_difference "Favorite.count", 1 do
      post favorites_path , params: { to_micropost_id: microposts(:tau_manifesto).id }
    end
  end

  test "cancel favorites" do
    log_in_as users(:michael)
    assert_difference "Favorite.count", -1 do
      delete favorite_path(favorites(:two))
    end
  end

  test "create should require logged-in user" do
    assert_no_difference "Favorite.count" do
      post favorites_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference "Favorite.count" do
      delete favorite_path(favorites(:one))
    end
    assert_redirected_to login_url
  end
end
