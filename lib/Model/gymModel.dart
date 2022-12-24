// class gymData {
//   int currentPage;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   String nextPageUrl;

//   gymData({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//   });

//   factory gymData.fromJson(Map<String, dynamic> json) => gymData(
//     currentPage: json["current_page"],
//     firstPageUrl: json["first_page_url"],
//     from: json["from"],
//     lastPage: json["last_page"],
//     lastPageUrl: json["last_page_url"],
//     nextPageUrl: json["next_page_url"],
//   );

//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "next_page_url": nextPageUrl,
//   };
// }
