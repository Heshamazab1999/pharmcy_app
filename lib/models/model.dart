class MedicineModel {
  dynamic a;
  dynamic b;
  dynamic c;
  dynamic d;
  dynamic e;
  dynamic f;
  dynamic g;
  dynamic h;
  dynamic i;
  dynamic j;
  dynamic k;
  dynamic l;

  MedicineModel(
      {this.a,
      this.b,
      this.c,
      this.d,
      this.e,
      this.f,
      this.g,
      this.h,
      this.i,
      this.j,
      this.k,
      this.l});

  MedicineModel.fromJson(Map<dynamic, dynamic> json) {
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
    e = json['E'];
    f = json['F'];
    g = json['G'];
    h = json['H'];
    i = json['I'];
    j = json['J'];
    k = json['K'];
    l = json['L'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['A'] = a;
    data['B'] = b;
    data['C'] = c;
    data['D'] = d;
    data['E'] = e;
    data['F'] = f;
    data['G'] = g;
    data['H'] = h;
    data['I'] = i;
    data['J'] = j;
    data['K'] = k;
    data['L'] = l;
    return data;
  }
}
