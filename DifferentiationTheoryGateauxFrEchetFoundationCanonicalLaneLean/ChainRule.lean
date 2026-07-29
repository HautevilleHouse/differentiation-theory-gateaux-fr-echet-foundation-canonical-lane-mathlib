import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.GateauxDifferentiability
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.FrechetDifferentiability

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure ChainRuleGateaux (X Y Z : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z] (f : X → Y) (g : Y → Z) (x : X) where
  fGateauxDiff : GateauxDifferentiability X Y f x
  gGateauxDiffAtFx : GateauxDifferentiability Y Z g (f x)
  compositeGateauxDiff : GateauxDifferentiability X Z (g ∘ f) x
  derivativeComposition : Prop
  derivativeCompositionClosed : derivativeComposition

structure ChainRuleFrechet (X Y Z : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z] (f : X → Y) (g : Y → Z) (x : X) where
  fFrechetDiff : FrechetDifferentiabilityPackage X Y f x
  gFrechetDiffAtFx : FrechetDifferentiabilityPackage Y Z g (f x)
  compositeFrechetDiff : FrechetDifferentiabilityPackage X Z (g ∘ f) x
  derivativeComposition : Prop
  derivativeCompositionClosed : derivativeComposition

structure ChainRuleEvidence (X Y Z : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z] (f : X → Y) (g : Y → Z) (x : X) where
  chainRuleGateaux : ChainRuleGateaux X Y Z f g x
  chainRuleFrechet : ChainRuleFrechet X Y Z f g x

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse