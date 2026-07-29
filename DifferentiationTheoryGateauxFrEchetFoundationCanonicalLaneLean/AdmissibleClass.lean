import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure AdmissibleDifferentiationClass where
  object : DifferentiableAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleDifferentiationClass) : Prop :=
  GateauxFrechetWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse