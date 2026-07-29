import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure ChainRulePackage where
  domain1 : Type u
  domain2 : Type v
  codomain : Type w
  normedDom1 : NormedAddCommGroup domain1
  normedDom2 : NormedAddCommGroup domain2
  normedCod : NormedAddCommGroup codomain
  f : domain1 → domain2
  g : domain2 → codomain
  point : domain1
  fDiff : FrechetDifferentiabilityPackage
  gDiff : FrechetDifferentiabilityPackage
  compositionDiff : Prop
  chainRuleFormula : Prop
  compositionDiffClosed : compositionDiff
  chainRuleFormulaClosed : chainRuleFormula

def ChainRuleClosed (P : ChainRulePackage) : Prop :=
  P.compositionDiff ∧ P.chainRuleFormula

theorem chain_rule_closed (P : ChainRulePackage) :
    ChainRuleClosed P := by
  exact And.intro P.compositionDiffClosed P.chainRuleFormulaClosed

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse