// To parse this JSON data, do
//
//     final watchProvidersResponse = watchProvidersResponseFromJson(jsonString);

import 'dart:convert';

WatchProvidersModelResponse watchProvidersResponseFromJson(String str) =>
    WatchProvidersModelResponse.fromJson(json.decode(str));

class WatchProvidersModelResponse {
  final int id;
  final Results results;

  WatchProvidersModelResponse({
    required this.id,
    required this.results,
  });

  factory WatchProvidersModelResponse.fromJson(Map<String, dynamic> json) =>
      WatchProvidersModelResponse(
        id: json["id"],
        results: Results.fromJson(json["results"]),
      );
}

class Results {
  final Ag? ag;
  final Ag? ar;
  final At? at;
  final At? au;
  final Ag? ba;
  final Ag? bb;
  final At? be;
  final Ag? bg;
  final Ag? bm;
  final Ag? bo;
  final Ag? br;
  final Ag? bs;
  final At? ca;
  final At? ch;
  final Ag? cl;
  final Ag? co;
  final Ag? cr;
  final Ag? cz;
  final At? de;
  final At? dk;
  final Ag? resultsDo;
  final Ag? ec;
  final At? es;
  final At? fi;
  final At? fr;
  final At? gb;
  final Ag? gf;
  final Ag? gt;
  final At? hk;
  final Ag? hn;
  final Ag? hr;
  final Ag? hu;
  final At? ie;
  final At? il;
  final Ag? resultsIn;
  final At? it;
  final Ag? jm;
  final Ag? lc;
  final Ag? md;
  final Ag? me;
  final Ag? mk;
  final Ag? mx;
  final Ag? ni;
  final At? nl;
  final At? no;
  final At? nz;
  final Ag? pa;
  final Ag? pe;
  final Ag? pl;
  final Ag? py;
  final Ag? ro;
  final Ag? rs;
  final At? ru;
  final At? se;
  final Ag? si;
  final Ag? sk;
  final Ag? sv;
  final Ag? tc;
  final Ag? tt;
  final At? tw;
  final At? us;
  final Ag? uy;
  final Ag? ve;

  Results({
    this.ag,
    this.ar,
    this.at,
    this.au,
    this.ba,
    this.bb,
    this.be,
    this.bg,
    this.bm,
    this.bo,
    this.br,
    this.bs,
    this.ca,
    this.ch,
    this.cl,
    this.co,
    this.cr,
    this.cz,
    this.de,
    this.dk,
    this.resultsDo,
    this.ec,
    this.es,
    this.fi,
    this.fr,
    this.gb,
    this.gf,
    this.gt,
    this.hk,
    this.hn,
    this.hr,
    this.hu,
    this.ie,
    this.il,
    this.resultsIn,
    this.it,
    this.jm,
    this.lc,
    this.md,
    this.me,
    this.mk,
    this.mx,
    this.ni,
    this.nl,
    this.no,
    this.nz,
    this.pa,
    this.pe,
    this.pl,
    this.py,
    this.ro,
    this.rs,
    this.ru,
    this.se,
    this.si,
    this.sk,
    this.sv,
    this.tc,
    this.tt,
    this.tw,
    this.us,
    this.uy,
    this.ve,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        ag: Ag.fromJson(json["AG"] ?? {}),
        ar: Ag.fromJson(json["AR"] ?? {}),
        at: At.fromJson(json["AT"] ?? {}),
        au: At.fromJson(json["AU"] ?? {}),
        ba: Ag.fromJson(json["BA"] ?? {}),
        bb: Ag.fromJson(json["BB"] ?? {}),
        be: At.fromJson(json["BE"] ?? {}),
        bg: Ag.fromJson(json["BG"] ?? {}),
        bm: Ag.fromJson(json["BM"] ?? {}),
        bo: Ag.fromJson(json["BO"] ?? {}),
        br: Ag.fromJson(json["BR"] ?? {}),
        bs: Ag.fromJson(json["BS"] ?? {}),
        ca: At.fromJson(json["CA"] ?? {}),
        ch: At.fromJson(json["CH"] ?? {}),
        cl: Ag.fromJson(json["CL"] ?? {}),
        co: Ag.fromJson(json["CO"] ?? {}),
        cr: Ag.fromJson(json["CR"] ?? {}),
        cz: Ag.fromJson(json["CZ"] ?? {}),
        de: At.fromJson(json["DE"] ?? {}),
        dk: At.fromJson(json["DK"] ?? {}),
        resultsDo: Ag.fromJson(json["DO"] ?? {}),
        ec: Ag.fromJson(json["EC"] ?? {}),
        es: At.fromJson(json["ES"] ?? {}),
        fi: At.fromJson(json["FI"] ?? {}),
        fr: At.fromJson(json["FR"] ?? {}),
        gb: At.fromJson(json["GB"] ?? {}),
        gf: Ag.fromJson(json["GF"] ?? {}),
        gt: Ag.fromJson(json["GT"] ?? {}),
        hk: At.fromJson(json["HK"] ?? {}),
        hn: Ag.fromJson(json["HN"] ?? {}),
        hr: Ag.fromJson(json["HR"] ?? {}),
        hu: Ag.fromJson(json["HU"] ?? {}),
        ie: At.fromJson(json["IE"] ?? {}),
        il: At.fromJson(json["IL"] ?? {}),
        resultsIn: Ag.fromJson(json["IN"] ?? {}),
        it: At.fromJson(json["IT"] ?? {}),
        jm: Ag.fromJson(json["JM"] ?? {}),
        lc: Ag.fromJson(json["LC"] ?? {}),
        md: Ag.fromJson(json["MD"] ?? {}),
        me: Ag.fromJson(json["ME"] ?? {}),
        mk: Ag.fromJson(json["MK"] ?? {}),
        mx: Ag.fromJson(json["MX"] ?? {}),
        ni: Ag.fromJson(json["NI"] ?? {}),
        nl: At.fromJson(json["NL"] ?? {}),
        no: At.fromJson(json["NO"] ?? {}),
        nz: At.fromJson(json["NZ"] ?? {}),
        pa: Ag.fromJson(json["PA"] ?? {}),
        pe: Ag.fromJson(json["PE"] ?? {}),
        pl: Ag.fromJson(json["PL"] ?? {}),
        py: Ag.fromJson(json["PY"] ?? {}),
        ro: Ag.fromJson(json["RO"] ?? {}),
        rs: Ag.fromJson(json["RS"] ?? {}),
        ru: At.fromJson(json["RU"] ?? {}),
        se: At.fromJson(json["SE"] ?? {}),
        si: Ag.fromJson(json["SI"] ?? {}),
        sk: Ag.fromJson(json["SK"] ?? {}),
        sv: Ag.fromJson(json["SV"] ?? {}),
        tc: Ag.fromJson(json["TC"] ?? {}),
        tt: Ag.fromJson(json["TT"] ?? {}),
        tw: At.fromJson(json["TW"] ?? {}),
        us: At.fromJson(json["US"] ?? {}),
        uy: Ag.fromJson(json["UY"] ?? {}),
        ve: Ag.fromJson(json["VE"] ?? {}),
      );
}

class Ag {
  final String link;
  final List<Flatrate>? flatrate;

  Ag({
    required this.link,
    this.flatrate,
  });

  factory Ag.fromJson(Map<String, dynamic> json) => Ag(
        link: json["link"] ?? '',
        flatrate: (json["flatrate"] as List<dynamic>?)
            ?.map((x) => Flatrate.fromJson(x))
            .toList(),
      );
}

class Flatrate {
  final String? logoPath;
  final int? providerId;
  final String? providerName;
  final int? displayPriority;

  Flatrate({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory Flatrate.fromJson(Map<String, dynamic> json) => Flatrate(
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        displayPriority: json["display_priority"],
      );

  Map<String, dynamic> toJson() => {
        "logo_path": logoPath,
        "provider_id": providerId,
        "provider_name": providerName,
        "display_priority": displayPriority,
      };
}

class At {
  final String link;
  final List<Flatrate>? buy;
  final List<Flatrate>? rent;
  final List<Flatrate>? free;
  final List<Flatrate>? ads;
  final List<Flatrate>? flatrate;

  At({
    required this.link,
    this.buy,
    this.rent,
    this.free,
    this.ads,
    this.flatrate,
  });

  factory At.fromJson(Map<String, dynamic> json) => At(
        link: json["link"] ?? '',
        buy: (json["buy"] as List<dynamic>?)
            ?.map((x) => Flatrate.fromJson(x))
            .toList(),
        rent: (json["rent"] as List<dynamic>?)
            ?.map((x) => Flatrate.fromJson(x))
            .toList(),
        free: (json["free"] as List<dynamic>?)
            ?.map((x) => Flatrate.fromJson(x))
            .toList(),
        ads: (json["ads"] as List<dynamic>?)
            ?.map((x) => Flatrate.fromJson(x))
            .toList(),
        flatrate: (json["flatrate"] as List<dynamic>?)
            ?.map((x) => Flatrate.fromJson(x))
            .toList(),
      );
}
