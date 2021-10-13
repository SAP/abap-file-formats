define view entity z_aff_example_ddls
  as select from spfli
{
  key carrid    as Carrid,
  key connid    as Connid,
      countryfr as Countryfr,
      countryto as Countryto
}
