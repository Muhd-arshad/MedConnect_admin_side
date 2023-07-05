
import 'dart:convert';

Admindashbordmodel admindashbordmodelFromJson(String str) => Admindashbordmodel.fromJson(json.decode(str));

String admindashbordmodelToJson(Admindashbordmodel data) => json.encode(data.toJson());

class Admindashbordmodel {
    final int? activeUsers;
    final int? blockedUsers;
    final int? activeDoctors;
    final int? blockedDoctors;
    final int? verifiedDoctors;
    final int? unVerifiedDoctors;
    final int? totalRevenue;
    final int? successfulAppointments;
    final int? cancelledAppointments;

    Admindashbordmodel({
         this.activeUsers,
         this.blockedUsers,
         this.activeDoctors,
         this.blockedDoctors,
         this.verifiedDoctors,
         this.unVerifiedDoctors,
         this.totalRevenue,
         this.successfulAppointments,
         this.cancelledAppointments,
    });

    factory Admindashbordmodel.fromJson(Map<String, dynamic> json) => Admindashbordmodel(
        activeUsers: json["activeUsers"],
        blockedUsers: json["blockedUsers"],
        activeDoctors: json["activeDoctors"],
        blockedDoctors: json["blockedDoctors"],
        verifiedDoctors: json["verifiedDoctors"],
        unVerifiedDoctors: json["unVerifiedDoctors"],
        totalRevenue: json["totalRevenue"],
        successfulAppointments: json["successfulAppointments"],
        cancelledAppointments: json["cancelledAppointments"],
    );

    Map<String, dynamic> toJson() => {
        "activeUsers": activeUsers,
        "blockedUsers": blockedUsers,
        "activeDoctors": activeDoctors,
        "blockedDoctors": blockedDoctors,
        "verifiedDoctors": verifiedDoctors,
        "unVerifiedDoctors": unVerifiedDoctors,
        "totalRevenue": totalRevenue,
        "successfulAppointments": successfulAppointments,
        "cancelledAppointments": cancelledAppointments,
    };
}
