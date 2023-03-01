module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x20xbf16>
    %1 = call @expected() : () -> tensor<20x20xbf16>
    %2 = stablehlo.exponential_minus_one %0 : tensor<20x20xbf16>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xbf16>, tensor<20x20xbf16>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x20xbf16> {
    %0 = stablehlo.constant dense<"0x8B400440CA4022C0B4C0C03F743FA43F0AC0953F7F4004C1944094BE83C053BE93C09EC0D8BF7DBDD93F973E8AC025C0AABFB73F0FC002C01C419A408BBFC5BE90BF4DC08F400DBF76BF8CBF903F9D4054BF13C1924062408640E83F2F40CF3B80C00440C23F52C0723FD13ECF3FC04017C02CBB9D3E684046C02EBEDDBFD23F8F3E9D4017404CBE7340C5C0B8C04BBFB9BF1440C7BF733E06402F404340A9BF1DC0DFBEA03E873DA040E83F3BBE953FA33FE23E4F40F13D10409DC042C06CC07DC0C240183FC63EC93F32C0BCBF5BC08FBF5CC0793F0640893F0BC091BCB0C00EC080404CBFBABEF13E52C0BB3F43C0E63E42C097BF57C095C06140DBBCE33DA8BD78C0893FEDBF9C3F29BFA4BF3140894095C024C06B3F133F8240043F12C0C43E8CC0833E58403A40E5BE70BFCA3F3440A1C06040A7C0073F37C0443E71BE8D3F73408E402AC0A3404B3DA23F903EAABFC4BED9BF22C0863FC63FC03F9C40D8BFB5BEBABFBEBE71BF26407DC00BC0023F953F5A3EE1BF65BF06C05A40B44095C0FEBF23C003408AC09F4026402EC0253E10403D408B400740C240293FB03F8B3F70BEB840BE3FC1BF44C09FC04DC01840043FD3BF9AC09B3FA9BD0B4176BE86C05C3F1140CE3F7E3EE6C070C0A64080408EC0B640FEBF71BF1EBF844064C05F400140D0BF773F51BF9F4084C0A93E98BEF5BFAB3F7CBFFBBB30C07EC0C93FEC3F08C07340E540B33D0441F73D4B3E17C05AC0BA40984028C06B3F47C00C4056BE8D401B4105C0783F2ABFBD3E1BBF2940093F0240833EAE402F3FE3407C40DCBED5BFBC4082C0343F38C0794046C033409C3F9CBFDBBFB64075C0903F80C0593FA93F344049BD1A40D53FC7408840A5C076BEA8BF4BC0A0C006C024417B3FB3C0E93FC53F3FC079C0AFBF8F3F01C0D04091C0C03FB93C1FC07A40E13F4340FBC06DBED7403C403DC01140D73FA13F7540843F903F923F25BE23C010BF0DC0A8BD264095C030404640BCBF91BE93C045C0913DAB3F24C0D6BF0B3F40409C3FAB3C093FA33F92401FBF4B40F83E38C0954039C0073F35C0804091BF5EC014BFE3BFEFBE913FD7BE913E0140EC40863EB8BE97BF38C0B640774081402ABF8F3F"> : tensor<20x20xbf16>
    return %0 : tensor<20x20xbf16>
  }
  func.func private @expected() -> tensor<20x20xbf16> {
    %0 = stablehlo.constant dense<"0x9842DC400A446CBF7FBF5F40CC3F264062BF0D40534280BFCA4281BE7CBF3FBE7DBF7EBF51BF75BD8E40B03E7DBF6DBF3CBF4B4065BF5EBF8646F4422ABFA4BE2DBF76BFAC42D9BE1EBF2ABF0540064310BF80BFBE4205428242A4406641D03B7BBFDC40634076BFC93F013F8140C94368BF2CBBB83E124274BF20BE52BF8540A53E0643194139BE2E427FBF7FBF0CBF44BF12414ABF893EE4406641A0413CBF6ABFB5BEBC3E8C3D1343A4402BBE0D4025400E3FC341003E08417EBF74BF7ABF7BBFD643503FF23E744070BF45BF78BF2CBF78BFD33FE440F53F63BF90BC7FBF64BF56420DBF9CBE1A3F76BF544074BF113F74BF31BF77BF7EBF0342D8BCF03DA1BD7BBFF53F58BF1940F7BE39BF6E418F427EBF6CBFC13F473F64422D3F66BFEF3E7DBF953EE2418A41B9BE1CBF76407A417EBF00427FBF323F71BF583E57BE01402E42A7426EBF2243503D2340A63E3CBFA3BE51BF6CBFED3F6D405F40024351BF98BE44BF9FBE1CBF46417BBF63BF293F0D40733E54BF17BF60BFE9418A437EBF5DBF6CBFD8407DBF0F4346416FBF333E084191419842E840D6436F3F3D40FB3F56BE9D435A4047BF74BF7EBF76BF1C412D3F4FBF7EBF1740A2BDB9455BBE7CBFAE3F0A418040903E80BF7ABF324356427DBF93435DBF1CBFECBE734279BFFD41D0404EBFD03F0FBF0F437CBFC83E84BE5ABF334020BFFABB70BF7BBF7440AA4061BF2E42A044BB3D6F45033E613E68BF78BFA743E5426DBFC13F75BFFD4041BEA2427C4660BFD13FF8BEE53EE9BE5041353FD440953E65437B3F96444942B3BE50BFB2437CBF833F72BF404274BF7641194034BF52BF93437ABF05407BBFAB3F30407A4144BD21418940FB438A427FBF5BBE3BBF75BF7EBF60BFDD46D53F7FBFA6406A4073BF7BBF3FBF04405EBF26447DBF5F40BB3C6BBF43429A40A04180BF54BE4F448F4173BF0A418C4021403442E73F0540084018BE6CBFDCBE64BFA1BD46417EBF6A41A84145BF7DBE7DBF74BF963D33406CBF50BF393F99411940AD3C353F2540BE42EDBEB741203F72BFD04272BF323F71BF56422EBF78BFE1BE55BFBFBE0740B0BEA83ED040C744993E9BBE31BF72BF93433A425D42F8BE0440"> : tensor<20x20xbf16>
    return %0 : tensor<20x20xbf16>
  }
}