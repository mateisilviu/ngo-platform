import '../constants/constants.dart';
import '../models/analytic_info_model.dart';
import '../models/discussions_info_model.dart';
import '../models/referal_info_model.dart';

List analyticData = [
  AnalyticInfo(
    title: "Subscribers",
    count: 720,
    svgSrc: "icons/Subscribers.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Post",
    count: 820,
    svgSrc: "icons/Post.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "Pages",
    count: 920,
    svgSrc: "icons/Pages.svg",
    color: orange,
  ),
  AnalyticInfo(
    title: "Comments",
    count: 920,
    svgSrc: "icons/Comments.svg",
    color: green,
  ),
];

List discussionData = [
  DiscussionInfoModel(
    imageSrc: "images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Mar 19,2023",
  ),
  DiscussionInfoModel(
    imageSrc: "images/photo2.jpg",
    name: "Devi Carlos",
    date: "Mar 19,2023",
  ),
  DiscussionInfoModel(
    imageSrc: "images/photo3.jpg",
    name: "Danar Comel",
    date: "Mar 19,2023",
  ),
  DiscussionInfoModel(
    imageSrc: "images/photo4.jpg",
    name: "Karin Lumina",
    date: "Mar 19,2023",
  ),
  DiscussionInfoModel(
    imageSrc: "images/photo5.jpg",
    name: "Fandid Deadan",
    date: "Mar 19,2023",
  ),
  DiscussionInfoModel(
    imageSrc: "images/photo1.jpg",
    name: "Lutfhi Chan",
    date: "Mar 19,2023",
  ),
];

List referalData = [
  ReferalInfoModel(
    title: "Facebook",
    count: 234,
    svgSrc: "icons/Facebook.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Twitter",
    count: 234,
    svgSrc: "icons/Twitter.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Linkedin",
    count: 234,
    svgSrc: "icons/Linkedin.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "icons/Dribbble.svg",
    color: red,
  ),
];
