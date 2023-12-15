import instaloader

def get_followers(username, password):
    L = instaloader.Instaloader()
    L.login(username, password)
    profile = instaloader.Profile.from_username(L.context, username)
    followers = set(profile.get_followers())
    return followers

def get_following(username, password):
    L = instaloader.Instaloader()
    L.login(username, password)
    profile = instaloader.Profile.from_username(L.context, username)
    following = set(profile.get_followees())
    return following

def main():
    username = input("Enter your Instagram username: ")
    password = input("Enter your Instagram username: ")
    
    try:
        followers = get_followers(username, password)
        following = get_following(username, password)

        not_following_back = following - followers

        print("\nUsers not following you back:")
        for user in not_following_back:
            print(user.username)

    except instaloader.exceptions.InstaloaderException as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
