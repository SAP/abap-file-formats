define view entity z_ddls_aff_example
  as select from spfli
{
  key carrid    as Carrid,
  key connid    as Connid,
      countryfr as Countryfr,
      countryto as Countryto
}
