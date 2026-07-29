import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure FrechetDifferentiabilityPackage where
  domain : Type u
  codomain : Type v
  [normedDomain : NormedAddCommGroup domain]
  [normedCodomain : NormedAddCommGroup codomain]
  point : domain
  linearMap : domain → codomain
  remainder : domain → codomain
  limitCondition : Prop

structure FrechetDifferentiabilityEvidence (F : FrechetDifferentiabilityPackage) where
  linearMapContinuous : Continuous (F.linearMap)
  remainderVanishes : Filter.Tendsto (fun h : domain => F.remainder h / ‖h‖) (nhds 0) (nhds 0)

def FrechetDifferentiabilityClosed (F : FrechetDifferentiabilityPackage) : Prop :=
  Continuous (F.linearMap) ∧ Filter.Tendsto (fun h : domain => F.remainder h / ‖h‖) (nhds 0) (nhds 0)

theorem frechet_differentiability_closed_from_evidence (F : FrechetDifferentiabilityPackage)
    (E : FrechetDifferentiabilityEvidence F) : FrechetDifferentiabilityClosed F := by
  exact And.intro E.linearMapContinuous E.remainderVanishes

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse
