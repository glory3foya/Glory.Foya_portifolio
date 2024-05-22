class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? gitHubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.gitHubLink,
  });
}


// ###########
// Hobby projects to watch
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/project/music player.png',
     title: 'Music Player', 
     subtitle: 'This is an android app that plays music from your local drive',
     gitHubLink: 'https://github.com/glory3foya/music-player-flutter',
  ),
  ProjectUtils(
    image: 'assets/project/survey.png',
     title: 'Survey Form', 
     subtitle: 'This is an android app that collects the residential details of the user',
     gitHubLink: 'https://github.com/glory3foya/Survey-Form',
  ),
  
];

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/project/robotcombat.jpeg',
     title: 'Robot Combat', 
     subtitle: 'Are events where armed remote-controlled robots compete in battles',
     gitHubLink: 'https://www.youtube.com/results?search_query=robot+combat+competiton',
  ),
  ProjectUtils(
    image: 'assets/project/automationM.jpeg',
     title: 'Automation machine Documentaries', 
     subtitle: 'Are documentaries about automation and machines  ',
     gitHubLink: 'https://www.youtube.com/results?search_query=automation+machine+documentaries',
  ),
  ProjectUtils(
    image: 'assets/project/ai.jpg',
     title: 'AI in agriculture', 
     subtitle: 'It uses advanced technologies to enhance various aspects of farming. ',
     gitHubLink: 'https://www.youtube.com/results?search_query=ai+in+agriculture',
  ),
   ProjectUtils(
    image: 'assets/project/music.png',
     title: 'Music Technology', 
     subtitle: 'Encompasses techniques used for creating and producing music ',
     gitHubLink: 'https://www.youtube.com/results?search_query=music+technology',
  ),
  
];