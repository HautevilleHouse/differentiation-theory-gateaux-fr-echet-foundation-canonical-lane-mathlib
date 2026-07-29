import canonicalLaneMathlib.AdmissibleClass
import DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.GateauxDifferentiability
import DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.FréchetDifferentiability

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure GateauxFrechetEquivalencePackage where
  gateauxPackage : GateauxDifferentiabilityPackage
  frechetPackage : FrechetDifferentiabilityPackage
  equivalenceHolds : Prop
  gateauxImpliesFrechet : Prop
  frechetImpliesGateaux : Prop

structure GateauxFrechetEquivalenceEvidence (E : GateauxFrechetEquivalencePackage) where
  equivalenceHoldsClosed : E.equivalenceHolds
  gateauxImpliesFrechetClosed : E.gateauxImpliesFrechet
  frechetImpliesGateauxClosed : E.frechetImpliesGateaux

def GateauxFrechetEquivalenceClosed (E : GateauxFrechetEquivalencePackage) : Prop :=
  E.equivalenceHolds ∧ E.gateauxImpliesFrechet ∧ E.frechetImpliesGateaux

theorem gateaux_frechet_equivalence_closed_from_evidence (E : GateauxFrechetEquivalencePackage)
    (Ev : GateauxFrechetEquivalenceEvidence E) : GateauxFrechetEquivalenceClosed E := by
  exact And.intro Ev.equivalenceHoldsClosed (And.intro Ev.gateauxImpliesFrechetClosed Ev.frechetImpliesGateauxClosed)

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse
