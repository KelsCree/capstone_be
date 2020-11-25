# SwingVote

An app to educate users on who is making policy decisions that affect their lives, and encourages them to engage in grassroots advocacy.

# Table Of Contents 
- [Description](https://github.com/KelsCree/capstone-be#description)
- [How It Works](https://github.com/KelsCree/capstone-be#how-it-works)
- [Example Code](https://github.com/KelsCree/capstone-be#example-code)
- [Technology Used](https://github.com/KelsCree/capstone-be#technology-used)
- [Main Features](https://github.com/KelsCree/capstone-be#main-features)
- [Features in Progress](https://github.com/KelsCree/capstone-be#features-in-progress)
- [Challenges](https://github.com/KelsCree/capstone-be#features-in-progress)
- [Contact Information](https://github.com/KelsCree/capstone-be#contact-information)
- [Link to Backend Repo](https://github.com/KelsCree/capstone-be#link-to-backend-repo)

## Description

SwingVote is a mobile application that helps to bridge the common knowledge gap between politics and policy and encourages grassroots engagement. With SwingVote, users to easily access their political representatives, candidates running office, and upcoming election information. 

## How It Works

[SwingVote Video Demo](https://youtu.be/5Yb4LVCDGtM)

## Example Code 
```
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      @token = JWT.encode({ user_id: @user.id }, Rails.application.secrets.secret_key_base[0])
      render json: { user: @user, token: @token, liked: @user.liked_candidates, disliked: @user.disliked_candidates }
    else  
      render json: { errors: ['Invalid username or password'] }
    end
  end

```
```
  def create
    @liked_candidate = LikedCandidate.create(
      user_id: params[:user_id],
      cand_id: params[:cand_id]
    )
    render json: @liked_candidate
  end
```
```
  def by_zip_full
    @candidates = VoteSmart::Candidate.get_by_zip params[:zip5], nil, params[:zip4], nil
    render json: @candidates
  end
```

## Technology Used

  The app is currently only built for and tested with an iOS device (iPhone 12 Pro Max) using an iOS Expo emulator.

- Javascript
- React Native
- Ruby on Rails
- [Vote Smart API](https://votesmart.org/share/api#.X616OJNKii4)
- Bcrypt
- Expo
- Lottie


## Main Features

- User can create a new account or sign in as an existing user using JWT authorization tokens.
- User can browse through political candidates, representatives, and elections narrowed by zip code (+4 optional, but returns more accurate results).
- User select a candidate or official's to view their bio page with more in-depth information
- User can "like" or "dislike" a candidate or official, which is then stored in the database
- User can visit their own profile page to see their activity summary, including all of their liked and disliked candidates

## Features in Progress

- Plans to build in additional functionality for browsing through candidates by name and including vote history for officials
- Plans to deploy the app using firebase and heroku

## Challenges

This was my first attempt building a mobile app in React Native. I had expected the process to be very similar to regular React, but there were definitely some big differences including the types of components you can use and the lack of actual CSS. However, after I got the hang of it, I ended up preferring mobile development and using Javascript for styling. 

Another challenge I faced was finding a reliable set of data to work with. There are quite a few government/political APIs out there, but they all contain varying amounts of useful information. VoteSmart ended up meeting most of my needs, and although it did cost a small fee, it went to a good cause. There was a Ruby gem API wrapper available that I incorporated, which made the fetch calls from my backend much simpler. 

## Contact Information

[Kelsey Creehan](https://www.linkedin.com/in/kelsey-creehan/)

## Link to Frontend Repo

https://github.com/KelsCree/capstone_fe