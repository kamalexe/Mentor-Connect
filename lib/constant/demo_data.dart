import 'package:mentor_connect/constant/images.dart';

class UniversityEventModel {
  final String universityName;
  final String postImage;
  final String universityLogo;
  final String postDate;
  final String eventTime;
  final String eventDate;

  UniversityEventModel({
    required this.universityName,
    required this.postImage,
    required this.universityLogo,
    required this.postDate,
    required this.eventTime,
    required this.eventDate,
  });
}

final List<UniversityEventModel> universityEvents = [
  UniversityEventModel(
    universityName: 'Punjab University',
    postImage: ImagePaths.liveWebinar,
    universityLogo: ImagePaths.panjabUniv,
    postDate: '2 days ago',
    eventTime: '10:30 - 12:00 PM',
    eventDate: '24 Aug, 2024 - Monday',
  ),
  UniversityEventModel(
    universityName: 'IIT Kanpur',
    postImage: ImagePaths.liveWebinar2,
    universityLogo: ImagePaths.images1,
    postDate: '5 days ago',
    eventTime: '11:00 - 01:00 PM',
    eventDate: '20 Aug, 2024 - Friday',
  ),
  UniversityEventModel(
    universityName: 'Devfolio',
    postImage: ImagePaths.event3,
    universityLogo: ImagePaths.company3,
    postDate: '5 days ago',
    eventTime: '11:00 - 01:00 PM',
    eventDate: '20 Aug, 2024 - Friday',
  ),
];

// __________
class GigModel {
  final MentorModel mentor;
  final String gigTitle;
  final String description;
  final String postedTime;
  final double price;
  final bool save;

  GigModel({
    required this.gigTitle,
    required this.description,
    required this.postedTime,
    required this.price,
    required this.save,
    required this.mentor,
  });
}

final List<GigModel> demoGigs = [
  GigModel(
    mentor: demoMentors[0],
    gigTitle: 'Need a UI designer for 12 screens',
    description:
        'Design a user interface for a home service booking app where a user can book AC repair service, make home screen, authentication, orders, notifications...',
    postedTime: '8 hours ago',
    price: 1000.0,
    save: true,
  ),
  GigModel(
    mentor: demoMentors[0],
    gigTitle: 'Social media marketing campaign for a startup',
    description:
        'Looking for someone to manage social media marketing for a new tech startup, including content creation, scheduling posts, and analyzing performance...',
    postedTime: '2 days ago',
    price: 5000.0,
    save: false,
  ),
  GigModel(
    mentor: demoMentors[1],
    gigTitle: 'Build an e-commerce website',
    description:
        'Develop a fully responsive e-commerce website with features like product listing, user accounts, payment gateway integration, and order management system...',
    postedTime: '1 week ago',
    price: 15000.0,
    save: true,
  ),
  GigModel(
    mentor: demoMentors[1],
    gigTitle: 'Write 10 blog posts on digital marketing',
    description:
        'Create engaging and SEO-friendly blog posts on topics such as social media strategies, content marketing, and the latest trends in digital marketing...',
    postedTime: '3 days ago',
    price: 1200.0,
    save: true,
  ),
];

// ---------------------------

// List of demo MentorModel instances
List<MentorModel> demoMentors = [
  MentorModel(
    name: 'Aman Dhattarwal',
    rating: '4.7',
    title: 'Founder of Apna College',
    profileImagePath: ImagePaths.channelsProfile,
    description: '9Million+ students ❤️| Making students Tech Job ready | Owner of Apna College | 22 TEDx | 100+ Seminars',
  ),
  MentorModel(
    name: 'Nishant Chahar',
    rating: '4.8',
    title: 'SDE at Microsoft',
    profileImagePath: ImagePaths.image1,
    description: 'Building @Tayyari | Ex-Microsoft | 400k+ Subs on YT | NSIT',
  ),
  MentorModel(
    name: 'Alakh Panday(Physics wallah)',
    rating: '5.0',
    title: 'Founder and CEO of PW',
    profileImagePath: ImagePaths.image2,
    description: 'Mission to Empower 25 Crore Youth of BHARAT by 2030',
  ),
];

class MentorModel {
  final String name;
  final String title;
  final String description;
  final String profileImagePath;
  final String rating;

  MentorModel({required this.name, required this.title, required this.description, required this.profileImagePath, required this.rating});
}

final List<String> timeSlots = [
  '10 AM - 11 AM',
  'Booked',
  '12 PM - 1 PM',
  '1 PM - 2 PM',
  '2 PM - 3 PM',
  '4 PM - 5 PM',
  '5 PM - 6 PM',
  '6 PM - 7 PM',
  'Emergency booking',
  'Booked',
];

final List<String> demoDates = [
  '10 Aug, 24',
  '11 Aug, 24',
  '12 Aug, 24',
  '13 Aug, 24',
  '14 Aug, 24',
  '15 Aug, 24',
  '16 Aug, 24',
  '17 Aug, 24',
  '18 Aug, 24',
  '19 Aug, 24'
];
final List<String> demoLanguage = [
  'English',
  'Hindi',
];
