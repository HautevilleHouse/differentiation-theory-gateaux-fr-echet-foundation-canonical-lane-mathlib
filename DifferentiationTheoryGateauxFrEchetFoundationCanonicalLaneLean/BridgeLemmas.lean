import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleDifferentiationClass) : Prop :=
  GateauxFrechetWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleDifferentiationClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse