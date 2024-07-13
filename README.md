# WorldTime
A class to fetch current time and time by timezone from the worldtimeapi.org

/// A class to fetch current time and time by timezone from the WorldTimeAPI
 void main(List<String> args) {
   WorldTime.fetchCurrentTime().then((value) => print(value)); // Fetch current time
   WorldTime.fetchByTimezone('America/Chicago').then((value) => print(value)); // Fetch by currret of America/Chicago
 }
