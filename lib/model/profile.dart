class Profile {
  String id;
  String firstName;
  String lastName;
  String userName;
  String address;
  String imageUrl;

  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.address,
    this.imageUrl,
  });
}

Profile defaultUser = Profile(
  id: 'fire',
  firstName: 'Eddie',
  lastName: 'More',
  userName: 'fire2014',
  address: 'Handina Kumba',
  imageUrl: 'assets/img/default-profile.jpg',
);
